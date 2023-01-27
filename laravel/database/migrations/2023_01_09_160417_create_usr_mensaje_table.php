<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('usr_mensaje', function (Blueprint $table) {
            $table->unsignedBigInteger('id_env')->references('id')->on('users')->delete('cascade');
            $table->unsignedBigInteger('id_dest')->references('id')->on('users')->delete('cascade');
            $table->unsignedBigInteger('id_mensaje')->references('id')->on('mensajes')->delete('cascade'); 
            $table->primary(['id_dest', 'id_mensaje']);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('usr_mensaje');
    }
};
