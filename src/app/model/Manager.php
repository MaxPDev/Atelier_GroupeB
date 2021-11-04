<?php

namespace app\model;

class Manager extends \Illuminate\Database\Eloquent\Model
{
    protected $table = 'manager';
    protected $primaryKey = 'id';
    public $timestamps = false;

    public function user()
    {
        return $this->belongsTo(User::class, 'id_user');
    }
}
