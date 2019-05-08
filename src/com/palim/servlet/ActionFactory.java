package com.palim.servlet;

public class ActionFactory {
	private ActionFactory() {
		
	}
		public static Action getAction(String cmd){
		Action a = null;
		switch(cmd) {
		case "homeUI":
			a = new HomeUI();
			break;
		case "addMemberUI":
			a = new AddMemberUI();
			break;
		case "loginUI":
			a = new LoginUI();
			break;
		case "updateMainUI":
			a = new UpdateMainUI();
			break;
			/*
		case "updateNicknameUI":
			a = new UpdateNicknameUI();
			break;
		case "updatePhoneUI":
			a = new UpdatePhoneUI();
			break;
			*/
		case "updatePWUI":
			a = new UpdatePWUI();
			break;
			/*
		case "updateAlarmUI":
			a = new UpdateAlarmUI();
			break;
		case "dropUserUI":
			a = new DropUserUI();
			break;
			*/
		case "hopeListUI":
			a = new HopeListUI();
			break;
			/*
		case "insertHpriceUI" : 
			a = new InsertHpriceUI();
			break;
		case "seizeTodayUI" : 
			a = new SeizeTodayUI();
			break;			
		case "findIDUI":
			a=new FindIDUI();
			break;
		case "findPWEmailUI":
			a=new FindPWEmailUI();
			break;			
		case "findPWPhoneUI":
			a=new FindPWPhoneUI();
			break;			
		case "findPWSetPWUI":
			a=new FindPWSetPWUI();
			break;		*/
		case "addMemberAction":
			a= new AddMemberAction();
			break;
		case "loginAction":
			a=new LoginAction();
			break;
		case "logoutAction":
			a = new LogoutAction();
			break;
			/*
		case "findPWSetPWAction" :
			a= new FindPWSetPWAction();
			break;
		case "dropUserAction" :
			a= new DropUserAction();
			break;
			*/
		case "checkIDAction" :
			a = new CheckIDAction();
			break;
		case "checkNicknameAction" :
			a = new CheckNicknameAction();
			break;
		case "checkPhoneAction" :
			a = new CheckPhoneAction();
			break;
			/*
		case "findIDAction":
			a=new FindIDAction();
			break;			
		case "findPWEmailAction":
			a=new FindPWEmailAction();
			break;			
		case "updateMainAction":
			a=new UpdateMainAction();
			break;	
		case "updatePhoneAction" : 
			a = new UpdatePhoneAction();
			break;			
		case "updatePWAction" : 
			a = new UpdatePWAction();
			break;			
		case "updateAlarmAction" :
			a= new UpdateAlarmAction();
			break;
		case "updateNicknameAction" : 
			a = new UpdateNicknameAction();
			break;		
		case "checkDuplicateHopeProductAction" : 
			a = new CheckDuplicateHopeProductAction();
			break;
		case "insertHpriceAction" : 
			a = new InsertHpriceAction();
			break;		
		case "seizeTodayAction" : 
			a = new SeizeTodayAction();
			break;			
			*/
		case "sendCertificateNumberAction" :
			a = new SendCertificateNumberAction();
			break;	
			/*
		case "hopeListOrderAction" :
			a = new HopeListOrderAction();
          	break;
		case "hopeListpageAction" :
			a = new HopeListPageAction();
          	break;
		case "hopeListNextPageAction" :
			a = new HopeListNextPageAction();
			break;
		case "hopeListPreviousPageAction" :
			a = new HopeListPreviousPageAction();
			break;
		case "updateHpriceAction" : 
			a = new UpdateHpriceAction();
			break;
		case "deleteHpriceAction" :
			a = new DeleteHpriceAction();
			break;
		case "getLpriceFirstDayAction" :
			a = new GetLpriceFirstDayAction();
			break;
		case "sendAction" :
			a = new SendAction();
			break;
		case "searchAction" :
			a = new SearchAction();
			break;
		case "searchListAction" :
			a = new SearchListAction();
			break;	
		case "pimgPreviousPageAction" :
			a = new PimgPreviousPageAction();
			break;
		case "pimgNextPageAction" : 
			a = new PimgNextPageAction();
			break;
		case "pimgPageAction" :
			a = new PimgPageAction();
			break;		
		case "plistPreviousPageAction" :
			a = new PlistPreviousPageAction();
			break;
		case "plistNextPageAction" :
			a = new PlistNextPageAction();
			break;
		case "plistPageAction" :
			a = new PlistPageAction();
			break;
		case "searchAppAction" :
			a = new SearchAppAction();
			break;
		case "pimgAppPageAction" :
			a = new PimgAppPageAction();
			break;
		case "seizeTodayAppAction" :
			a = new SeizeTodayAppAction();
			break;
		case "seizeTodayAppPageAction" :
			a = new SeizeTodayAppPageAction();
			break;
			*/
		default :
			a = new HomeUI();
			break;		
		}
		return a;
	}
}
