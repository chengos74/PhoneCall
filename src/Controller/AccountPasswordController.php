<?php

namespace App\Controller;

use App\Entity\User;
use App\Form\ChangePasswordType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;

class AccountPasswordController extends AbstractController
{
    private $entityManager;
    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }
    #[Route('/compte/modifier-mon-mot-de-passe', name: 'account_password')]
    public function index(Request $request, UserPasswordHasherInterface $encoder): Response
    {

        $user = $this->getUser();
        $form = $this->createForm(ChangePasswordType::class, $user);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $old_pwd = $form->get('old_password')->getData();

            if ($encoder->isPasswordValid($user, $old_pwd)) {
                $new_pwd = $form->get('new_password')->getData();

                $password = $encoder->hashPassword(
                    $user,
                    $new_pwd
                );
                $user->setPassword($password);
                $this->entityManager->flush();

                $this->addFlash('success', "Votre mot de passe a été mis à jour");
                return $this->redirectToRoute('account_password');
            } else {
                $this->addFlash('warning', "Votre mot de passe n'a pas été mis à jour");

            }
        }


        return $this->render('account/password.html.twig', [
            'password' => $form->createView(),
            // 'notifications' => $notifications
        ]);
    }
}
