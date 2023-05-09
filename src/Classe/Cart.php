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
        $session = $this->stack->getSession();

        $cart = $session->get('cart', []);

        if (!empty($cart[$id])) {
            $cart[$id]++;
        } else {
            $cart[$id] = 1;
        }


        $session->set('cart', $cart);


        // $this->getSession()->set('cart', [
        //     'id' => $id,
        //     'quantity' => 1
        // ]);
    }

    public function get()
    {
        // $methodget = $this->stack->getSession();
        $session = $this->stack->getSession();
        // return $methodget->get('cart');
        return $session->get('cart');
    }

    public function remove()
    {
        $session = $this->stack->getSession();
        return $session->remove('cart');
    }

    private function getSession(): SessionInterface
    {
        return $this->stack->getSession();
    }
}
