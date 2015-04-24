"""
A good portion of this code was lifted from the PyYaml Codebase.

http://pyyaml.org/:
Copyright (c) 2006 Kirill Simonov

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
"""

import re, datetime

class ConverterError(Exception):pass

timestamp_regexp = re.compile(
        r'''^(?P<year>[0-9][0-9][0-9][0-9])
            -(?P<month>[0-9][0-9]?)
            -(?P<day>[0-9][0-9]?)
            (?:(?:[Tt]|[ \t]+)
            (?P<hour>[0-9][0-9]?)
            :(?P<minute>[0-9][0-9])
            :(?P<second>[0-9][0-9])
            (?:\.(?P<fraction>[0-9]*))?
            (?:[ \t]*(?P<tz>Z|(?P<tz_sign>[-+])(?P<tz_hour>[0-9][0-9]?)
            (?::(?P<tz_minute>[0-9][0-9]))?))?)?$''', re.X)
            
def timestamp(value):
    match = timestamp_regexp.match(value)
    if match is None:
        raise ConverterError('Unknown DateTime format, %s try %%Y-%%m-%%d %%h:%%m:%%s.d'%value)
    values = match.groupdict()
    year = int(values['year'])
    month = int(values['month'])
    day = int(values['day'])
    if not values['hour']:
        return datetime.date(year, month, day)
    hour = int(values['hour'])
    minute = int(values['minute'])
    second = int(values['second'])
    fraction = 0
    if values['fraction']:
        fraction = values['fraction'][:6]
        while len(fraction) < 6:
            fraction += '0'
        fraction = int(fraction)
    delta = None
    if values['tz_sign']:
        tz_hour = int(values['tz_hour'])
        tz_minute = int(values['tz_minute'] or 0)
        delta = datetime.timedelta(hours=tz_hour, minutes=tz_minute)
        if values['tz_sign'] == '-':
            delta = -delta
    data = datetime.datetime(year, month, day, hour, minute, second, fraction)
    if delta:
        data -= delta
    return data

timeonly_regexp = re.compile(
        r'''^(?P<hour>[0-9][0-9]?)
            :(?P<minute>[0-9][0-9])
            (?::(?P<second>[0-9][0-9]))?
            (?:\.(?P<fraction>[0-9]*))?$''', re.X)

def timeonly(value):
    match = timeonly_regexp.match(value)
    if match is None:
        raise ConverterError('Unknown Time format, %s try HH:MM:SS.dddddd'%value)
    values = match.groupdict()
    hour = int(values['hour'])
    minute = int(values['minute'])
    second = 0
    if values['second']:
        second = int(values['second'])
    fraction = 0
    if values['fraction']:
        fraction = values['fraction'][:6]
        while len(fraction) < 6:
            fraction += '0'
        fraction = int(fraction)
    return datetime.time(hour, minute, second, fraction)