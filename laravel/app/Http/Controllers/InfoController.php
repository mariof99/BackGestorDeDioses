<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ParametroGeneral;
use App\Models\User;
use App\Models\Humano;
use Illuminate\Support\Facades\Redis;
use Termwind\Components\Raw;
use Illuminate\Support\Facades\DB;

use Faker\Generator;

// $faker = Faker\Generator::create();

class InfoController extends Controller {

    public function getDestino(Request $request) {
        try {
            $user = Humano::find($request->id);

            $resp  = response()->json(['destino' => $user->destino], 200);
        }
        catch (\Exception $e) {
            $resp = response()->json(['error' => 'ha ocurrido un error'], 204);
        }

        return $resp;
    }

    public function updateDestino(Request $request) {
        $datos = $request->all();

        $user = Humano::find($request->id);
        $user->destino = $datos['destino'];

        try {
            $user->save();

            $resp = response()->json(['mensaje' => 'modificado con éxito'], 201);
        }
        catch(\Exception $e) {
            $resp = response()->json(['mensaje' => 'ha surgido un error'], 204);
        }

        return $resp;
    }

    public function getCaracteristicas(Request $request) {
        try {
            $user = User::find($request->id);

            $caracteristicas = [
                'sabiduria' => $user->sabiduria,
                'nobleza' => $user->nobleza,
                'virtud' => $user->virtud,
                'maldad' => $user->maldad,
                'audacia' => $user->audacia
            ];

            $resp = response()->json($caracteristicas, 200);
        }
        catch (\Exception $e) {
            $resp = response()->json(['error' => 'ha ocurrido un error'], 204);
        }

        return $resp;
    }

    public function updateCaracteristicas($id, Request $request) {
        $datos = $request->all();

        $user = User::find($id);

        foreach ($datos as $caracterisitica => $valor) { // este bucle actualiza sólo las características que no están vacías
            if ($valor != '') $user->{($caracterisitica)} = $valor;
        }

        try {
            $user->save();

            $resp = response()->json(['mensaje' => 'modificado con éxito'], 201);
        }
        catch (\Exception $e) {
            $resp = response()->json(['mensaje' => 'ha surgido un error'], 204);
        }

        return $resp;
    }

    public function getHumanos($idDios) {
        try {
            $humanos = DB::select('SELECT id, name, sabiduria, nobleza, virtud, maldad, audacia FROM users
                JOIN humanos ON users.id = humanos.id_humano WHERE humanos.idDios = ?', [$idDios]);
            $resp = response()->json($humanos, 200);
        }
        catch (\Exception $e) {
            $resp = response()->json(['mensaje' => 'ha surgido un error'], 203);
        }

        return $resp;
    }

    public function getHumanosVivos($idDios) {
        try {
            $humanos = DB::select('SELECT id, name, sabiduria, nobleza, virtud, maldad, audacia FROM users
                JOIN humanos ON users.id = humanos.id_humano WHERE humanos.id_dios = ? AND cielo_infierno IS NULL', [$idDios]);
            $resp = response()->json($humanos, 200);
        } 
        catch (\Exception $e) {
            $resp = response()->json(['mensaje' => 'ha surgido un error'], 203);
        }

        return $resp;
    }

    
    public function crearHumanoDios($id, Request $request) {
        $user = new User;
        $user->name = $request->name;
        $user->email = $request->email;
        $user->password = bcrypt($request->passwd);
        $user->activo = true;
        $user->sabiduria = $request->sabiduria;
        $user->nobleza = $request->nobleza;
        $user->virtud = $request->virtud;
        $user->maldad = $request->maldad;
        $user->audacia = $request->audacia;

        $humano = new Humano;
        $humano->destino = $request->destino;
        $humano->id_dios = $id;
        
        try {
            $user->save();
            
            $humano->id_humano = $user->id;
            $humano->save();

            $resp = response()->json(['msg' => 'creado con exito', 'success' => true], 200);
        }
        catch (\Exception $e) {

            $resp = response()->json(['msg' => 'se ha producido un error', 'success' => false], 200);
        }

        return $resp;
    }

    public function crearHumanosMultiple($id, Request $request) {

        $faker = Faker\Generator::create();

        try {
            for ($i = 0; $i < $request->nHumanos; $i++) { 
                $user = new User;
                $user->name = $faker->name;
                $user->email = $faker->email;
                $user->password = bcrypt($faker->passwd);
                $user->activo = true;
                $user->sabiduria = random_int(1, 5);
                $user->nobleza = random_int(1, 5);
                $user->virtud = random_int(1, 5);
                $user->maldad = random_int(1, 5);
                $user->audacia = random_int(1, 5);

                $humano = new Humano;
                $humano->destino = random_int(1, 100);
                $humano->id_dios = $id;

                
                $user->save();
                    
                $humano->id_humano = $user->id;
                $humano->save();
        
                
            }
        }
        catch (\Exception $e) {
            
            $resp = response()->json(['msg' => 'se ha producido un error', 'cod' => -1], 200);
        }

        $resp = response()->json(['msg' => 'creado con exito', 'cod' => 0], 200);
    }

    public function updateParamsGenerales($id, Request $request) {
        $p = ParametroGeneral::find($id);
        $p->valor = $request->valor;
        try {
            $p->save();
            $msg = ['msg' => 'modificado con éxito'];
            $cod = 201;
        }
        catch (\Exception $e) {
            $msg = ['msg' => 'se ha producido un error'];
            $cod = 203;
        }

        return response()->json($msg, $cod);
    }
}
