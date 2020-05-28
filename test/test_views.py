import unittest
from hello_world import app
from hello_world.formater import SUPPORTED


koko = b'<?xml version="1.0" ?>\n\
<greetings>\n    <name>Kokos</name>\n    \
<mgs>Hello World!</mgs>\n</greetings>\n'


class FlaskrTestCase(unittest.TestCase):
    def setUp(self):
        app.config['TESTING'] = True
        self.app = app.test_client()

    def test_outputs(self):
        rv = self.app.get('/outputs')
        s = str(rv.data)
        ','.join(SUPPORTED) in s

    def test_msg_with_output(self):
        rv = self.app.get('/?output=json')
        self.assertEqual(b'{\n    "imie": "Kokos",\n    "mgs": "Hello World!"\n}', rv.data)

    def test_msg_with_output_xml(self):
        rv = self.app.get('/?output=xml')
        self.assertEqual(koko, rv.data)
