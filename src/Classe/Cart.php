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
        $cart = $this->stack->get('cart', []);

        if (!empty($cart[$id])) {
            $cart[$id]++;
        } else {
            $cart[$id] = 1;
        }


        $this->stack->set('cart', $cart);

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

    public function remove()
    {
        return $this->stack->remove('cart');
    }

    private function getSession(): SessionInterface
    {
        return $this->stack->getSession();
    }
}
