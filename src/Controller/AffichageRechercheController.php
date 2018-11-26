<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

class AffichageRechercheController extends AbstractController
{
    /**
     * @Route("/affichage/recherche", name="affichage_recherche")
     */
    public function index()
    {
        return $this->render('affichage_recherche/index.html.twig', [
            'controller_name' => 'AffichageRechercheController',
        ]);
    }
}
