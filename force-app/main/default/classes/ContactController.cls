public with sharing class ContactController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactList() {
        return [
            SELECT
                Id,
                Name,
                FirstName,
                LastName,
                Title,
                Phone,
                Email,
                Picture__c
            FROM Contact
            WHERE Picture__c != NULL
            WITH SECURITY_ENFORCED
            LIMIT 10
        ];
    }

    @AuraEnabled(cacheable=true)
    public static List<Contact> findContacts(String searchKey) {
        String key = '%' + searchKey + '%';
        return [
            SELECT Id, Name, Title, Phone, Email, Picture__c
            FROM Contact
            WHERE Name LIKE :key AND Picture__c != NULL
            WITH SECURITY_ENFORCED
            LIMIT 10
        ];
    }

    @AuraEnabled(cacheable=true)
    public static Contact getSingleContact() {
        return [
            SELECT Id, Name, Title, Phone, Email, Picture__c
            FROM Contact
            WITH SECURITY_ENFORCED
            LIMIT 1
        ];
    }

    @AuraEnabled
    public static void updateContacts(List<Contact> contactsForUpdate) {
        // Make sure we can update the database before trying to update
        if (!Schema.sObjectType.Contact.isUpdateable()) {
            throw new SecurityException(
                'Insufficient permissions to update contacts'
            );
        }
        update contactsForUpdate;
    }
    
    @AuraEnabled(cacheable=true)
    public static list<contact> getContacts(){
        try {
            System.debug('getContacts query:');        
            if (true) {
                // Throw an AuraHandledException with a custom error message
                throw new AuraHandledException('Input cannot be null or empty');
            }
            return [select FirstName, LastName, Email FROM contact limit 10];           
        } catch (Exception e) {
            System.debug('getContacts error:'+e);
            throw new AuraHandledException(e.getMessage());
        }
    }
}