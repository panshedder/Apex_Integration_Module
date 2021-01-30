@isTest
public with sharing class ParkLocatorTest {
    @isTest public static void ParkLocatorTest() {
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        String country = 'Chile';
        //['San Eugenio', 'Santa Ines'];
        String[] result = ParkLocator.country(country);
        System.assertEquals('San Eugenio', result[0]);
        System.assertEquals('Santa Ines', result[1]);
    }
}
