<?php

namespace ecommApp;

class Model_Order extends \Model_Table{
	public $table='ecommApp_Order';

	function init(){
		parent::init();
		$this->hasOne('ecommApp/Shop','shop_id');
		$this->hasOne('ecommApp/Member','member_id');
		
		$this->addField('total_gross_amount');
		$this->addField('total_tax_amount');
		$this->addField('total_discount_amount');
		$this->addField('total_net_amount');

		$this->addField('created_at')->type('datetime')->defaultValue(date('Y-m-d H:i:s'));
		$this->addField('status')->setValueList(array('pending'=>'Pending','paid'=>'Paid','unpaid'=>'Un Paid','cancled'=>'Canceled','shipped'=>'Shipped','delivered'=>'Delivered'))->defaultValue('pending');

		$this->hasMany('ecommApp/OrderDetails','order_id');
		$this->hasMany('ecommApp/Payments','order_id');
		$this->add('dynamic_model/Controller_AutoCreator');
	}
}