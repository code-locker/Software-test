import unittest

from isTriangle import Triangle


class TestTriangleClassification(unittest.TestCase):

    def test_invalid_triangles(self):
        self.assertEqual(Triangle.classify(10, 1, 2), Triangle.Type.INVALID)
    
    def test_scalene_triangle(self):
        self.assertEqual(Triangle.classify(3, 4, 5), Triangle.Type.SCALENE)

    def test_equilateral_triangle(self):
        self.assertEqual(Triangle.classify(2, 2, 2), Triangle.Type.EQUILATERAL)
        
        
    def test_isosceles_triangle(self):
        self.assertEqual(Triangle.classify(2, 2, 3), Triangle.Type.ISOSCELES)
        self.assertEqual(Triangle.classify(2, 3, 2), Triangle.Type.ISOSCELES)
        self.assertEqual(Triangle.classify(3, 2, 2), Triangle.Type.ISOSCELES)
        self.assertEqual(Triangle.classify(1, 2, 2), Triangle.Type.ISOSCELES)
        self.assertEqual(Triangle.classify(3, 2, 2), Triangle.Type.ISOSCELES)


    def test_additional_tests(self):
        # Introduce mutations to the code and test for detection
        # Example mutations:
        # 1. Change '==' to '!='
        # 2. Change '<=' to '<'
        # 3. Change 'if trian == 0' to 'if trian == 1'
        # 4. Change 'return Triangle.Type.EQUILATERAL' to 'return Triangle.Type.SCALENE'

        # Mutations in the first condition
        self.assertEqual(Triangle.classify(1, 2, 2), Triangle.Type.ISOSCELES)
        
        # Mutations in the second condition
        self.assertEqual(Triangle.classify(2, 2, 2), Triangle.Type.EQUILATERAL)


if __name__ == '__main__':
    unittest.main()
