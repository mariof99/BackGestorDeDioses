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
        Schema::create('humanos', function (Blueprint $table) {
            $table->unsignedBigInteger('id_humano')->primary()->references('id')->on('users')->delete('cascade');
            $table->integer('destino')->default(0);
            $table->unsignedBigInteger('id_dios')->nullable();
            $table->string('cielo_infierno')->nullable();
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
        Schema::dropIfExists('humanos');
    }
};
