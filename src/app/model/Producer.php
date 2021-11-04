<?php

namespace app\model;

class Producer extends \Illuminate\Database\Eloquent\Model
{
    protected $table = 'producer';
    protected $primaryKey = 'id';
    public $timestamps = false;

    public function user()
    {
        return $this->belongsTo(User::class, 'id_user');
    }
}
