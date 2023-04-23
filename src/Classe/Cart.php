<?php

namespace App\Classe;

use Symfony\Component\HttpFoundation\RequestStack;
use Symfony\Component\HttpFoundation\Session\SessionInterface;

class Cart
{
    private RequestStack $stack;

    public function __construct(RequestStack $stack)
    {
        $this->stack = $stack;
    }

    public function add($id)
    {

        // $card = $this->stack->getSession()->get('cart', []);
        $this->stack->set('cart', [
            'id' => $id,
            'quantity' => 1
        ]);

        // $this->getSession()->set('cart', [
        //     'id' => $id,
        //     'quantity' => 1
        // ]);
    }

    public function get()
    {
        // $methodget = $this->stack->getSession();
        // return $methodget->get('cart');
        return $this->stack->get('cart');
    }

    private function getSession(): SessionInterface
    {
        return $this->stack->getSession();
    }
}
