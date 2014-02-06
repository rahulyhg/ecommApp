<?php

class page_ecommApp_page_owner_main extends page_componentBase_page_owner_main{
	public $menubar;
	function init(){
		parent::init();
		if(!$this->api->isAjaxOutput()){
			// TODO :: Get from Database
			$new_orders = 0;

			$this->menubar=$this->add('Menu');
			$this->menubar
				->addMenuItem('ecommApp_page_owner_main','Home')
				->addMenuItem('ecommApp_page_owner_orders','Orders ('.$new_orders.')')
				->addMenuItem('ecommApp_page_owner_products','Products')
				->addMenuItem('ecommApp_page_owner_brand','Products Brands')
				->addMenuItem('ecommApp_page_owner_categories','Products Category')
				->addMenuItem('ecommApp_page_owner_shipping','Shipping')
				->addMenuItem('ecommApp_page_owner_members','Members / Shoppers')
				->addMenuItem('ecommApp_page_owner_shopsettings','Shop Settings')

				;
			
		}
	}
}