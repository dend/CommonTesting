import argparse
from sys import argv

PARSER = argparse.ArgumentParser(description='ownership - version 0.1')
SUB_PARSERS = PARSER.add_subparsers(dest="commands_parser")
MAKE_PARSER = SUB_PARSERS.add_parser('find')

MAKE_PARSER.add_argument('--list', metavar='L', type=str,
                         help='List of docs.microsoft.com URLs for which .')
MAKE_PARSER.add_argument('--out', type=str, metavar='O',
                         help='Output path for the generated ownership file.')

ARGS = PARSER.parse_args()