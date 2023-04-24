<?php

namespace App\Controller;

use App\Classe\Cart;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\RequestStack;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class CartController extends AbstractController
{
    #[Route('/mon-panier', name: 'cart')]
    public function index(RequestStack $stack, Cart $cart): Response
    {
        // dd($stack->getSession()->get('cart'));
        dd($cart->get());

        return $this->render('cart/cart.html.twig');
    }

    #[Route('/cart/add/{id}', name: 'add_to_cart')]
    public function add(Cart $cart, $id): Response
    {
        $cart->add($id);
        // dd($id);

        return $this->redirectToRoute('cart');
    }

    #[Route('/cart/remove', name: 'remove_to_cart')]
    public function remove(Cart $cart): Response
    {
        $cart->remove();

        return $this->redirectToRoute('products');
    }
}
