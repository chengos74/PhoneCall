<?php

namespace App\Controller;

use App\Entity\Order;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class OrderCancelController extends AbstractController
{
    private $entityManager;
    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }
    #[Route('/commande/erreur/{stripeSessionId}', name: 'order_cancel')]
    public function index($stripeSessionId): Response
    {
        $order = $this->entityManager->getRepository(Order::class)->findOneByStripeSessionId($stripeSessionId); //on récupère notre order
        if (!$order || $order->getUser() != $this->getUser()) {
            return $this->redirectToRoute('home');
        }
        //envoyer un email à notre utilisateur pour lui indiquer l'échec de paiement
        return $this->render('order_cancel/orderCancel.html.twig', [
            'order' => $order
        ]);
    }
}
