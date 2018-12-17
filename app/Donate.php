<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Donate extends Model
{
    protected $fillable  = ['name', 'amount'];
    public $timestamps = false;
}
