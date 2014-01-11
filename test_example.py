from decimal import Decimal
from psycopg2 import connect
from psycopg2.extras import RealDictCursor

class TestDBConnection(object):
    """
    Test that we can successfully communicate with our
    testing database.
    """
    def setup(self):
        self.connection_args = {
            'host':'localhost',
            'port':5432,
            'user':'postgres',
            'database':'travis_postgis2'
        }

    def test_connection(self):
        db = connect(**self.connection_args).cursor(cursor_factory=RealDictCursor)


class Test_Points_ST_AsGeoJSONCall(object):
    """
    Test that we can access geometries stored in our database
    and successfully call ST_AsGeoJSON() function.
    """
    def setup(self):
        self.connection_args = {
            'host':'localhost',
            'port':5432,
            'user':'postgres',
            'database':'travis_postgis2'
        }
        self.db = connect(**self.connection_args).cursor(cursor_factory=RealDictCursor)
        self.select_statement = 'SELECT id, name, ST_AsGeoJSON(geom) FROM test_data.test_points;'
        self.expected = [
            {'st_asgeojson': '{"type":"Point","coordinates":[-54.9244916744992,-13.2793517321679]}',
             'id': Decimal('3'),
             'name': 'Red'},
            {'st_asgeojson': '{"type":"Point","coordinates":[88.1114957076896,46.4572555272149]}',
             'id': Decimal('2'),
             'name': 'Green'},
            {'st_asgeojson': '{"type":"Point","coordinates":[-103.709387602995,41.4792049222663]}',
             'id': Decimal('1'),
             'name': 'Blue'}
        ]

    def test_Select_ST_AsGeoJSON(self):
        """
        Test that a call to ST_AsGeoJSON Returns what we expect.
        """ 
        self.db.execute(self.select_statement)
        query_results = self.db.fetchall()
        assert query_results == self.expected
