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
      $conn = $this->getEntityManager()->getConnection();

    $sql = '
        SELECT * FROM Eleves
        ';
    $stmt = $conn->prepare($sql);
    $stmt->execute();

    // returns an array of arrays (i.e. a raw data set)
    $result = $stmt->fetchAll();
        return $this->render('affichage_recherche/index.html.twig', [
            'controller_name' => 'AffichageRechercheController',
            'resultats' => $result,
        ]);
    }
}
