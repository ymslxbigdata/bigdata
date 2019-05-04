package com.example.demo.common.constants;

import javax.persistence.EntityManager;

public class UserAuthConstants {

	public static final String JSON_FIELD_TYPE = "com.example.demo.common.entity.userType.StringJsonObject";

	public static final String TREE_ROOT = "ROOT";
	public static final String CHAR_ZERO = "0";
	public static final String CHAR_ONE = "1";
	
	public static final String SESSION_KEY_SITE_ID = "UserAuthSiteID";
	
	public static final class AuthMenuFormatFlgSub {
		public static final String TYPE_JSONSTRING						= "1";
		public static final String TYPE_MAP								= "2";
		public static final String TYPE_ALL								= "0";
	}
	
	/******************************************************/
	/* master code id									*/
	/******************************************************/
	public static final class MstCodeIdSub {
		public static final String KEY_ACTIVESTS						= "C020";
		public static final String KEY_ORGLEVEL							= "C027";
		public static final String KEY_ORGTYPE							= "C029";
		public static final String KEY_ORGROLE							= "C030";
		public static final String KEY_JOBTYPE							= "C032";
		public static final String KEY_MENUTYPE							= "C033";
		public static final String KEY_OPENMETH							= "C034";
		public static final String KEY_ORGRELATION						= "C043";
		public static final String KEY_GENDER							= "C050";
	}

	public static final class ActiveSub {
		public static final String ACTIVE							= "C020ACTIVE";
		public static final String NONACTIVE						= "C020NONACTIVE";
	}
	
	public static final class OrgTypeSub {
		public static final String ORG_STRUCT						= "C030ORGSTRUCT";
	}
	
	public static final class MenuTypeSub {
		public static final String MENU_TYPE_INTERNAL 				= "CO33MENUTYPE1";
		public static final String MENU_TYPE_IFRAME 				= "CO33MENUTYPE2";
		public static final String MENU_TYPE_LINK 					= "CO33MENUTYPE3";
	}
	
	public static final class SysParamKeys {
		public static final String ORGANIZATION						= "ORGANIZATION";
		public static final String PERSON							= "PERSON";
		public static final String USER								= "USER";
		public static final String ORGVERSIONSIGN					= "ORGVERSIONSIGN";
		public static final String JOBAUTHSIGN						= "JOBAUTHSIGN";
		public static final String MENUTREEEXPANDSIGN				= "MENUTREEEXPANDSIGN";
		public static final String MENUBUTTONAUTHDISPLAYSIGN		= "MENUBUTTONAUTHDISPLAYSIGN";
		public static final String USERCONTACTINFOEDITABLESIGN		= "USERCONTACTINFOEDITABLESIGN";
	}

	public static final class MenuActionType {
		public static final String MANAGE							= "manage";
		public static final String AUTHORITY						= "authority";
	}

	private static EntityManager userAuthEntityManager = null;


	public static void setEntityManager(EntityManager entityManager) {
		userAuthEntityManager = entityManager;
	}

	public static EntityManager getEntityManager() {
		return userAuthEntityManager;
	}
}
