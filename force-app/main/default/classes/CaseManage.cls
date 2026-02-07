@RestResource(urlMapping='*/cases')
global with sharing class CaseManage {
    
    @HTTPGet
    global static case getCaseById(){
        RestRequest rq = RestContext.getContext;
        //grab the ID fro the end of the Url
        String caseID = rq.requestURI.substring(re.requestURL.lastIndexOf('/'));
        Case cs = [select id, name from case where id=:caseID];
        return cs;

    }
     
    @HTTPPost
    global static void createCase(String subject, String Status, String origin, String priority){
        Case cs = new case (subject=subject, status=status, origin=origin, priority=priority);
        inseert cs;
        return cs.id;
    }

    @HTTPPatch
    global updateCase(){
        resquest rq = requestcontext.getContext;
        
    }
    
    @HTTPPut
    global doGet(){
        resquest rq = requestcontext.getContext;
        
    }
    

    @HTTDelete
    global doGet(){
        resquest rq = requestcontext.getContext;
        
    }
}