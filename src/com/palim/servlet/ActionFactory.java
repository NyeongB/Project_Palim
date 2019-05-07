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
		default :
			a = new HomeUI();
			break;		
		}
		return a;
	}
}
