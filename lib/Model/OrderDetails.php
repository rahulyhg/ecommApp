<?php

namespace ecommApp;

class Model_OrderDetails extends \Model_Table{
	public $table='ecommApp_OrderDetails';

	function init(){
		parent::init();
		$this->hasOne('ecommApp/Order','order_id');
		$this->hasOne('ecommApp/Product','product_id');
		$this->addField('qty')->caption('Quantity');
		$this->addField('rate');
		$this->addField('gross_amount');
		$this->addField('tax_amount');
		$this->addField('discount_amount');
		$this->addField('net_amount');
		$this->addField('extra_info')->system(true);

		$this->hasMany('ecommApp/Products','category_id');
		$this->add('dynamic_model/Controller_AutoCreator');
	}
}