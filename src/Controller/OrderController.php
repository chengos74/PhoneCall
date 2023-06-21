<?php

namespace App\Controller;

use DateTime;
use App\Classe\Cart;
use App\Entity\Order;
use App\Form\OrderType;
use App\Entity\OrderDetails;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class OrderController extends AbstractController
{
    private $entityManager;
    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }

    #[Route('/commande', name: 'order')]
    public function index(Cart $cart, Request $request): Response
    {
        if (!$this->getUser()->getAddresses()->getValues()) {
            return $this->redirectToRoute('account_address_add');
        }

        $form = $this->createForm(OrderType::class, null, [
            'user' => $this->getUser()
        ]);

        return $this->render('order/order.html.twig', [
            'order' => $form->createView(),
            'cart' => $cart->getFull()
        ]);
    }

    #[Route('/commande/recapitulatif', name: 'order_recap', methods: 'POST')]
    public function add(Cart $cart, Request $request): Response
    {

        $form = $this->createForm(OrderType::class, null, [
            'user' => $this->getUser()
        ]);

        $form->handleRequest($request); //on dit qu'il faut écouter notre requête
        if ($form->isSubmitted() && $form->isValid()) {

            $date = new \DateTimeImmutable();
            $carriers = $form->get('carrier')->getData();
            $delivery = $form->get('addresses')->getData();
            $delivery_content = $delivery->getFirstname() . ' ' . $delivery->getLastname(); //on cherche le nom et prénom de livraison
            $delivery_content .= '<br/>' . $delivery->getPhone(); //on cherche le numéro de téléphone pour la livraison
            if ($delivery->getCompany()) {
                $delivery_content .= '<br/>' . $delivery->getCompany(); //on affiche le nom de la société s'il y en a une
            }
            $delivery_content .= '<br/>' . $delivery->getAddress(); //on affiche l'adresse de livraison
            $delivery_content .= '<br/>' . $delivery->getPostal() . ' ' . $delivery->getCity(); //on affiche le code postal et la ville pour la livraison
            $delivery_content .= '<br/>' . $delivery->getCountry(); //on affiche le pays pour la livraison

            // dd($delivery_content);

            //Enregister la commande Order()
            $order = new Order(); //
            $reference = $date->format('dmY') . '-' . uniqid(); //on ajoute une nouvelle date avec jour, mois, année
            $order->setReference($reference);
            $order->setUser($this->getUser()); //on va set notre utilisateur
            $order->setCreatedAt($date); //on créer la date
            $order->setCarrierName($carriers->getName()); //on chercher le nom du transporteur
            $order->setCarrierPrice($carriers->getPrice()); //on cherche le prix du transporteur
            $order->setDelivery($delivery_content); //on insère la chaîne de caractère.
            $order->setState(0); //la commande n'est pas payée.
            $this->entityManager->persist($order);


            //Enregistrer mes produits dans OrderDetails
            foreach ($cart->getFull() as $product) {
                $orderDetails = new OrderDetails();
                $orderDetails->setMyOrder($order); //on lui passe la commande
                $orderDetails->setProduct($product['product']->getName()); //on va chercher le nom du produit
                $orderDetails->setQuantity($product['quantity']); //on va chercher la quantité du produit
                $orderDetails->setPrice($product['product']->getPrice()); //on va chercher le prix du produit
                $orderDetails->setTotal($product['product']->getPrice() * $product['quantity']); //on fait le total du produit
                // dd($product);
                $this->entityManager->persist($orderDetails);
            }

            // dd($order);//on affiche la commande
            $this->entityManager->flush();

            return $this->render('order/add.html.twig', [
                'cart' => $cart->getFull(),
                'carrier' => $carriers,
                'delivery' => $delivery_content,
                'reference' =>  $order->getReference()
            ]);
        }

        return $this->redirectToRoute('cart');
    }
}
