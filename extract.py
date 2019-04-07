import json
import os
import re
import time


lisp_path = './common-lisp'


def modified(file, code):
    '''Determined file is modified or not'''

    if not os.path.exists(file):
        return True
    with open(file, encoding='utf-8') as f:
        return f.read() != code


def save(file, code):
    '''Save content to file'''

    with open(file, mode='w', encoding='utf-8') as f:
        f.write(code)


def extract():
    '''Extract notebooks to separate file'''
    
    books = [f for f in os.listdir() if f.endswith('ipynb')]
    for book in books:
        with open(book, encoding='utf-8') as f:
            data = json.loads(f.read())
            for a, b in zip(data['cells'][::2], data['cells'][1::2]):
                title = '-'.join(re.findall(r'[0-9a-zA-Z_]+', a['source'][0])) + '.lisp'
                code = ''.join(b['source'])
                if modified(os.path.join(lisp_path, title), code):
                    print(f'Modified or new file: {title}')
                    save(os.path.join(lisp_path, title), code)


if __name__ == '__main__':
    start = time.time()
    extract()
    print('Used time: {:.5f} second'.format(time.time() - start))
