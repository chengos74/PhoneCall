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

    public function delete($id)
    {
        $session = $this->stack->getSession();

        $cart = $session->get('cart', []);

        unset($cart[$id]);

        return $session->set('cart', $cart);
    }

    public function decrease($id)
    {
        $session = $this->stack->getSession();

        $cart = $session->get('cart', []);
        if ($cart[$id] > 1) {
        } else {
        }
    }

    private function getSession(): SessionInterface
    {
        return $this->stack->getSession();
    }
}
