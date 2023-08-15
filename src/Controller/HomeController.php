<?php

namespace App\Controller;

use App\Classe\Cart;
use App\Entity\Header;
use App\Entity\Product;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class HomeController extends AbstractController
{
    private $entityManager;

    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }
    #[Route('/', name: 'home')]
    public function index(Cart $cart): Response
    {

        $cartComplete = [];
        if ($cart->get()) {
            foreach ($cart->get() as $id => $quantity) { //$id = key $quantity = value
                $cartComplete[] = [
                    'product' => $this->entityManager->getRepository(Product::class)->findOneById($id),
                    'quantity' => $quantity
                ];
            }
        }

        $products = $this->entityManager->getRepository(Product::class)->findByIsBest(1);
        // dd($products);

        $headers = $this->entityManager->getRepository(Header::class)->findAll();
        // dd($headers);

        return $this->render('home/home.html.twig', [
            'cart' => $cartComplete,
            'products' => $products,
            'headers' => $headers
        ]);
        // return $this->render('home/home.html.twig');
    }
}
