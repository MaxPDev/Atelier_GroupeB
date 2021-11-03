<?php

namespace app\model;

class User extends \Illuminate\Database\Eloquent\Model
{
    protected $table = 'user';
    protected $primaryKey = 'id';
    public $timestamps = false;

    public function manager()
    {
        return $this->hasMany(User::class, 'user_id');
    }
}
