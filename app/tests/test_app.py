import unittest

from app.lambda_function import concat, soma


class TestStringMethods(unittest.TestCase):

    def test_soma(self):
        x = 4
        y = 8

        result = soma(x, y)

        self.assertEqual(result, 12)

    def test_concat(self):
        x = "Rodrigo"
        y = "Amandio"

        result = concat(x, y)

        self.assertEqual(result, "Rodrigo-Amandio")
