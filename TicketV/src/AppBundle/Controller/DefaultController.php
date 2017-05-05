<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

class DefaultController extends Controller
{
    /**
     * @Route("/", name="homepage")
     */
    public function indexAction(Request $request)
    {

        $route = $this->generateRoute();
        $repository = $this->getDoctrine()
                           ->getRepository('AppBundle:Ticket');

        $tickets = $repository->getAllByUtilisateur($this->getUser()->getId());

        return $this->render('default/index.html.twig', [
            'base_dir' => realpath($this->getParameter('kernel.root_dir').'/..').DIRECTORY_SEPARATOR,
            'tickets' => $tickets,
            'route'=>$route
        ]);
    }

    /**
     * Generate the route for the Homepage
     *
     * @return ArrayCollection
     */
    public function generateRoute()
    {
        return ["Accueil"=>"active"];
    }
}
