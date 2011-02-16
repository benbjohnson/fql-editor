package fqleditor.schema
{
	/**
	 *	This class represents a column of a table in the Facebook API.
	 */
	public class Column
	{
		//----------------------------------------------------------------------
		//
		//	Constructor
		//
		//----------------------------------------------------------------------

		/**
		 *	Constructor.
		 */
		public function Column()
		{
			super();
		}
		

		//----------------------------------------------------------------------
		//
		//	Properties
		//
		//----------------------------------------------------------------------

		/**
		 *	The name of the column.
		 */
		public var name:String;

		/**
		 *	The data type.
		 */
		public var type:String;

		/**
		 *	The description of the column.
		 */
		public var description:String;

		/**
		 *	A flag stating if the column is indexable and can be searched.
		 */
		public var indexable:Boolean;
	}
}
