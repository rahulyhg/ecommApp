<?php

namespace xecommApp;

class Model_Product extends \Model_Table{
	public $table='xecommApp_products';

	function init(){
		parent::init();
		$this->hasOne('xecommApp/Category','category_id');

		$this->addField('sku');
		$this->addField('name')->Caption('Product Name');
		$this->addField('description')->type('text');
		$this->addField('original_price');
		$this->addField('sale_price');
		$this->addField('start_date');
		$this->addField('expiry_date');
		$this->addField('publish')->type('boolean');
		$this->add('filestore/Field_Image','Product_image_id');

		$this->hasMany('xecommApp/ProductDetails','product_id');
		$this->hasMany('xecommApp/ProductImages','product_id');
		$this->hasMany('xecommApp/CustomFields','product_id');


		$this->add('dynamic_model/Controller_AutoCreator');
	}
}

