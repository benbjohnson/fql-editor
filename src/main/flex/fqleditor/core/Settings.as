package fqleditor.core
{
	import flash.events.EventDispatcher;
	import flash.net.SharedObject;
	
	/**
	 *	This class represents the application settings that can be saved between
	 *	sessions.
	 */
	public class Settings extends EventDispatcher
	{
		//----------------------------------------------------------------------
		//
		//	Properties
		//
		//----------------------------------------------------------------------

		[Bindable]
		public var appId:String;


		//----------------------------------------------------------------------
		//
		//	Methods
		//
		//----------------------------------------------------------------------

		/**
		 *	Loads the settings from the local shared object.
		 */
		public function load():void
		{
			var lso:Object = SharedObject.getLocal("settings");
			appId = lso.data.appId;
		}

		/**
		 *	Saves the settings to the local shared object.
		 */
		public function save():void
		{
			var lso:Object = SharedObject.getLocal("settings");
			lso.data.appId = appId;
			lso.flush();
		}
	}
}
