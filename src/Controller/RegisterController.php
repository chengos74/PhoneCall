<?php

namespace App\Controller;

use App\Entity\User;
use App\Form\RegisterType;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;

class RegisterController extends AbstractController
{
    private $entityManager;
    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }
    #[Route('/inscription', name: 'register')]
    public function index(Request $request, UserPasswordHasherInterface $hasher): Response
    {
        $user = new User();
        $form = $this->createForm(RegisterType::class, $user);

        $form->handleRequest($request);



        if ($form->isSubmitted() && $form->isValid()) {
            $user = $form->getData();

            $password = $hasher->hashPassword(
                $user,
                $user->getPassword()
            );
            $user->setPassword($password);
            // dd($password);

            $this->entityManager->persist($user);
            $this->entityManager->flush();
            // dd($user);//on affiche les données qu'on a mis dans le formulaire
        }

        return $this->render('register/register.html.twig', [
            'formulaire' => $form->createView()
        ]);
    }
}
