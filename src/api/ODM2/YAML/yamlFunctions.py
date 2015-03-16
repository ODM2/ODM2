"""
Example using bootalchemy (if the model is within the same module)
"""
from _yaml import ScannerError
from bootalchemy.loader import Loader, YamlLoader
from .. import serviceBase
import ODM2.models as models
import yaml
from collections import OrderedDict

from yaml.loader import Loader
from yaml import scanner

class ODMLoader(Loader):
    def __init__(self, stream):

        Loader.__init__(self, stream)

    def fetch_alias(self):
        self.allow_simple_key = False
        self.forward()
    def fetch_anchor(self):
        self.allow_simple_key = False
        self.forward()

        # pass
    def fetch_more_tokens(self):

        # Eat whitespaces and comments until we reach the next token.
        self.scan_to_next_token()

        # Remove obsolete possible simple keys.
        self.stale_possible_simple_keys()

        # Compare the current indentation and column. It may add some tokens
        # and decrease the current indentation level.
        self.unwind_indent(self.column)

        # Peek the next character.
        ch = self.peek()

        # Is it the end of stream?
        if ch == u'\0':
            return self.fetch_stream_end()

        # Is it a directive?
        if ch == u'%' and self.check_directive():
            return self.fetch_directive()

        # Is it the document start?
        if ch == u'-' and self.check_document_start():
            return self.fetch_document_start()

        # Is it the document end?
        if ch == u'.' and self.check_document_end():
            return self.fetch_document_end()

        # TODO: support for BOM within a stream.
        #if ch == u'\uFEFF':
        #    return self.fetch_bom()    <-- issue BOMToken

        # Note: the order of the following checks is NOT significant.

        # Is it the flow sequence start indicator?
        if ch == u'[':
            return self.fetch_flow_sequence_start()

        # Is it the flow mapping start indicator?
        if ch == u'{':
            return self.fetch_flow_mapping_start()

        # Is it the flow sequence end indicator?
        if ch == u']':
            return self.fetch_flow_sequence_end()

        # Is it the flow mapping end indicator?
        if ch == u'}':
            return self.fetch_flow_mapping_end()

        # Is it the flow entry indicator?
        if ch == u',':
            return self.fetch_flow_entry()

        # Is it the block entry indicator?
        if ch == u'-' and self.check_block_entry():
            return self.fetch_block_entry()

        # Is it the key indicator?
        if ch == u'?' and self.check_key():
            return self.fetch_key()

        # Is it the value indicator?
        if ch == u':' and self.check_value():
            return self.fetch_value()

        # Is it an alias?
        if ch == u'*':
            return self.fetch_alias()

        # Is it an anchor?
        if ch == u'&':
            return self.fetch_anchor()

        # Is it a tag?
        if ch == u'!':
            return self.fetch_tag()

        # Is it a literal scalar?
        if ch == u'|' and not self.flow_level:
            return self.fetch_literal()

        # Is it a folded scalar?
        if ch == u'>' and not self.flow_level:
            return self.fetch_folded()

        # Is it a single quoted scalar?
        if ch == u'\'':
            return self.fetch_single()

        # Is it a double quoted scalar?
        if ch == u'\"':
            return self.fetch_double()

        # It must be a plain scalar then.
        if self.check_plain():
            return self.fetch_plain()

        # No? It's an error. Let's produce a nice error message.
        raise ScannerError("while scanning for the next token", None,
                "found character %r that cannot start any token"
                % ch.encode('utf-8'), self.get_mark())



class YamlFunctions(object):

    # _mapping_tag = yaml.resolver.BaseResolver.DEFAULT_MAPPING_TAG
    #
    # def dict_representer(dumper, data):
    #     return dumper.represent_dict(data.iteritems())
    #
    # def dict_constructor(loader, node):
    #     return OrderedDict(loader.construct_pairs(node))
    #
    # yaml.add_representer(OrderedDict, dict_representer)
    # yaml.add_constructor(_mapping_tag, dict_constructor)

    def __init__(self, session):
        self._session = session

    def loadFromFile(self, filename):
        """
        Open a YAML file to be loaded into the SQLAlchemy connection
        :filename: path to yaml file
        """

        s = self.extractYaml(filename)
        #for token in yaml.scan(s):
        #    print token

        if 'YODA' in s:
            print "<YODA Field FOUND! ... Manually removing it using 'dict.pop'> " \
                  "else it'll crash the program as sqlalchemy doesn't know what to do with it"
            s.pop('YODA')

        # debugging information
        self.printValues(s)

        yl = YamlLoader(models)
        # yl.from_list(self._session, [s])

    def loadFromFiles(self, files):
        """
        Load data from a list of yaml files
        """
        if not isinstance(files, list):
            files = [files]

        for item in files:
            self.loadFromFile(item)
    def extractYaml(self, filename):
        s = yaml.load(open(filename).read(), ODMLoader)
        return s
    def writeValues(self,s ):
        import os
        print "PWD: ", os.getcwd()
        with open('data.yaml', 'w') as outfile:
            outfile.write( yaml.dump(s, default_flow_style=True) )

    def printValues(self, s):
        import pprint
        pp =pprint.PrettyPrinter(indent=8)
        pp.pprint([s])

        for k,v in s.iteritems():
            print '-'*45
            print k
            print '-'*45
            for values in v:
                if isinstance(values, dict):
                    for item in values.iteritems():
                        print item
                    print

                elif isinstance(values, basestring):
                    print values












