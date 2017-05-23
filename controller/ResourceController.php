<?php
class ResourceController{
	private $method_map = ['GET' => 'getController', 'POST' => 'postController', 'PUT' => 'update', 'DELETE' => 'deleteController'];
	/*public function treat_request($request){
		return $this->{$this->method_map[$request->get_Method()]}($request);
	}*/
        
        public function treat_request($request){
            $resource = ucfirst($request->get_Resource());

            $operation = $request->get_Operation();
            
            $resource_Call = new $resource($request);
            
            return $resource_Call->$operation();
    }
        
}