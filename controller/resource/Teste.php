<?php

class Teste {
       
    private $request;
    
    public function __construct($request) {
        $this->request = $request;
    }
    
    public function teste(){
        header("HTTP/1.1 500 pita merde olha que coisa incrivel");
        header("Authorizaition: token dahora masse");
        exit;
        return $this->request->get_Resource();
    }
    
}
