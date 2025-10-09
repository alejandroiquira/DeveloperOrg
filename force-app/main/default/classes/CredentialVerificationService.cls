global with sharing class CredentialVerificationService {
    webservice static String verifyCredential(String lastName, String contactCertificationName) {

        System.debug('lastName:'+lastName);
        System.debug('contactCertificationName:'+contactCertificationName);
        
        String res = 'No record found';

        List<Contact> cont = [SELECT Id, lastName FROM Contact WHERE LastName = :lastName limit 1];

        if (!cont.isEmpty()){
            list<Contact_Certification__c> contactCertification = [SELECT Id, Name, Certification__c, isActive__c
                               FROM Contact_Certification__c WHERE name = :contactCertificationName
                     and contact__c = :cont[0].id];

            if (!contactCertification.isEmpty()){
                res = (contactCertification[0].isActive__c == true)? 'Valid':'Needs Renewal';
                return res;
            } 

        }
        return res;

    }
}