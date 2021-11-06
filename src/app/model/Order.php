<?php

namespace app\model;

class Order extends \Illuminate\Database\Eloquent\Model
{
    protected $table = 'order';
    protected $primaryKey = 'id';
    public $keyType = 'string';
    public $timestamps = true;

    public function products(){
        return $this->belongsToMany('app\model\Product','quantity','id_order','id_product')->withPivot('quantity');
    }
}
