from test_framework.main import *


class AdditionOfNumbers(Test):

    def test_body(self):
        self.press_button('1')
        self.press_button('0')
        self.press_button('+')
        self.press_button('2')
        self.press_button('=')
        return self.check_disp("15") #12


test = AdditionOfNumbers()
test.test_method()