<?php

namespace app\model;

class Order extends \Illuminate\Database\Eloquent\Model
{
    protected $table = 'order';
    protected $primaryKey = 'id';
    public $keyType = 'string';
    public $timestamps = true;

    public function products(){
        $this->belongsToMany(Product::class,'quantity','order_id','product_id')->withPivot( ['quantity'] );
    }
}
