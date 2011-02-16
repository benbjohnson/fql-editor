package fqleditor.schema
{
	/**
	 *	This class represents a table in the Facebook API.
	 */
	public class Table
	{
		//----------------------------------------------------------------------
		//
		//	Constructor
		//
		//----------------------------------------------------------------------

		/**
		 *	Constructor.
		 */
		public function Table()
		{
			super();
		}
		

		//----------------------------------------------------------------------
		//
		//	Properties
		//
		//----------------------------------------------------------------------

		/**
		 *	The name of the table.
		 */
		public var name:String;

		/**
		 *	A list of columns on the table.
		 */
		public var columns:Array = [];
	}
}
