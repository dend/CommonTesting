import argparse
from sys import argv
import urllib.request
from bs4 import BeautifulSoup

def get_owner(url):
    response = urllib.request.urlopen(url)
    page_source = response.read()

    soup = BeautifulSoup(page_source, 'html.parser')
    owner = soup.find("meta", attrs={'name':'ms.author'})
    if owner is not None:
    print(f'[info] Owner: {owner["content"]}')

PARSER = argparse.ArgumentParser(description='ownership - version 0.1')
SUB_PARSERS = PARSER.add_subparsers(dest="commands_parser")
MAKE_PARSER = SUB_PARSERS.add_parser('find')

MAKE_PARSER.add_argument('--list', metavar='L', type=str,
                         help='List of docs.microsoft.com URLs for which .')
MAKE_PARSER.add_argument('--out', type=str, metavar='O',
                         help='Output path for the generated ownership file.')

ARGS = PARSER.parse_args()

if len(argv) <= 1:
    print('[error] No command line arguments supplied to the CLI. Terminating.')
else:
    if ARGS.commands_parser == 'find':
        print('[info] Looking for ownership of docs.microsoft.com URLs...')

        if ARGS.list is not None and ARGS.out is not None:
            url_list = []
            owner_map = []

            with open(ARGS.list) as txt_file:
                url_list = txt_file.read().splitlines()

            if url_list is not None:
                for url in url_list:
                    print(f'[info] Looking for ownership for {url}...')
                    owner_map.append(get_owner(url))
            else:
                print('[error] No URLs were read from the file.')
    else:
        print('[error] The command you specified (or not) could not be used with the ownership tool.')