<?php

namespace App\Controller;

use App\Entity\Contact;
use App\Form\ContactType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bridge\Twig\Mime\TemplatedEmail;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class ContactController extends AbstractController
{

    private $entityManager;
    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }

    #[Route('/contact', name: 'contact')]
    public function index(Request $request, MailerInterface $mailer): Response
    {

        $contact = new Contact();

        //lorsque l'utilisateur est connecté l'email et le nom prénom s'affiche automatiquement
        if($this->getUser()){
            $contact->setFullName($this->getUser()->getFullName())
                    ->setEmail($this->getUser()->getEmail());
        }

        $form = $this->createForm(ContactType::class, $contact);
        $form->handleRequest($request);
        
        if($form->isSubmitted() && $form->isValid()){
            
            $contact = $form->getData();

            $this->entityManager->persist($contact);
            $this->entityManager->flush();

            //email
            $email = (new TemplatedEmail())
            ->from($contact->getEmail())
            ->to('chengkoeng@gmail.com')
            ->subject($contact->getSubject())
            // path of the Twig template to render
            ->htmlTemplate('emails/email.html.twig')

            // pass variables (name => value) to the template
            ->context([
                'contact' => $contact
            ]);

            $mailer->send($email);

            $this->addFlash(
                'success',
                'Votre message a bien été envoyé !'
            );

            return $this->redirectToRoute('contact');

        }

        return $this->renderForm('contact/contact.html.twig', [
            'contact' => $form
        ]);
    }
}
