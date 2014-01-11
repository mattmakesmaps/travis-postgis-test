class TestNothingReally(object):
    def setup(self):
        self.gold_value = 10

    def test_gold(self):
        assert self.gold_value == 10

    def test_gold_math(self):
        assert 5+5 == self.gold_value