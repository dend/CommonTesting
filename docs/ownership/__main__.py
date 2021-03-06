import argparse
from sys import argv
import urllib.request, urllib.error
from bs4 import BeautifulSoup
import csv

def get_owner(url):
    try:
        response = urllib.request.urlopen(url)
        page_source = response.read()

        soup = BeautifulSoup(page_source, 'html.parser')
        owner = soup.find("meta", attrs={'name':'ms.author'})
        if owner is not None:
            return {'url': url, 'owner': owner["content"]}
        else:
            return {'url': url, 'owner': 'UNKNOWN'}
    except urllib.error.HTTPError:
        return {'url': url, 'owner': '404'}

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

                    url_pair = get_owner(url)
                    owner_map.append(get_owner(url))

                    try:
                        with open(ARGS.out, 'w') as csv_file:
                            writer = csv.DictWriter(csv_file, fieldnames=['url', 'owner'])
                            writer.writeheader()
                            for data in owner_map:
                                writer.writerow(data)
                    except IOError:
                        print('[error] Failed to save file.')
                    
            else:
                print('[error] No URLs were read from the file.')
    else:
        print('[error] The command you specified (or not) could not be used with the ownership tool.')