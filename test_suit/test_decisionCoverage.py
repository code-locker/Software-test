import unittest
from isTriangle import Triangle

class TestTriangleClassification(unittest.TestCase):

    def test_invalid_triangles(self):
        self.assertEqual(Triangle.classify(0, 1, 2), Triangle.Type.INVALID)
        self.assertEqual(Triangle.classify(1, 0, 2), Triangle.Type.INVALID)
        self.assertEqual(Triangle.classify(1, 2, 0), Triangle.Type.INVALID)

    def test_scalene_triangle(self):
        self.assertEqual(Triangle.classify(3, 4, 5), Triangle.Type.SCALENE)
        self.assertEqual(Triangle.classify(2, 3, 4), Triangle.Type.SCALENE)

    def test_equilateral_triangle(self):
        self.assertEqual(Triangle.classify(2, 2, 2), Triangle.Type.EQUILATERAL)
        self.assertEqual(Triangle.classify(5, 5, 5), Triangle.Type.EQUILATERAL)

    def test_isosceles_triangle(self):
        self.assertEqual(Triangle.classify(2, 2, 3), Triangle.Type.ISOSCELES)
        self.assertEqual(Triangle.classify(2, 3, 2), Triangle.Type.ISOSCELES)
        self.assertEqual(Triangle.classify(3, 2, 2), Triangle.Type.ISOSCELES)

    def test_other_invalid_triangles(self):
        self.assertEqual(Triangle.classify(1, 2, 4), Triangle.Type.INVALID)
        self.assertEqual(Triangle.classify(4, 1, 2), Triangle.Type.INVALID)

if __name__ == '__main__':
    unittest.main()
