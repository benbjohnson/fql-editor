package fqleditor.schema
{
	/**
	 *	This class stores all the table and column information for the Facebook
	 *	API.
	 */
	public class Schema
	{
		//----------------------------------------------------------------------
		//
		//	Static Properties
		//
		//----------------------------------------------------------------------

		[Embed(source="../../../resources/schema.xml", mimeType="application/octet-stream")]
		private var data:Class;


		//----------------------------------------------------------------------
		//
		//	Constructor
		//
		//----------------------------------------------------------------------

		/**
		 *	Constructor.
		 */
		public function Schema()
		{
			super();
			load();
		}
		

		//----------------------------------------------------------------------
		//
		//	Properties
		//
		//----------------------------------------------------------------------

		/**
		 *	A list of Facebook FQL tables.
		 */
		public var tables:Array;


		//----------------------------------------------------------------------
		//
		//	Methods
		//
		//----------------------------------------------------------------------

		private function load():void
		{
			// Load schema from embeded XML
			var xml:XML = new XML((new data()).toString());
			
			// Create tables and columns
			var tables:Array = [];
			for each(var tableXml:XML in xml.table) {
				var table:Table = new Table();
				table.name = tableXml.@name;
				
				// Add columns
				for each(var columnXml:XML in tableXml.column) {
					var column:Column = new Column();
					column.name        = columnXml.@name;
					column.type        = columnXml.@type;
					column.description = columnXml.@description;
					column.indexable   = (columnXml.@indexable == "true");
					table.columns.push(column);
				}
				
				tables.push(table);
			}

			this.tables = tables;
		}
	}
}
