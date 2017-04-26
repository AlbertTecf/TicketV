<?php

namespace AppBundle\Repository;

use AppBundle\Entity\PlageTravail;
use Doctrine\ORM\Query\ResultSetMapping;
use Doctrine\ORM\Query\ResultSetMappingBuilder;
/**
 * TicketRepository
 *
 * This class was generated by the Doctrine ORM. Add your own custom
 * repository methods below.
 */
class PlageTravailRepository extends \Doctrine\ORM\EntityRepository
{

    public function getAllByTicket($id_ticket)
    {

        $rsm = new ResultSetMapping();

        $query_sql = 'SELECT pt.*  FROM plage_travail pt WHERE id_ticket = ?';

        $rsm = new ResultSetMappingBuilder($this->getEntityManager());

        $rsm->addEntityResult(PlageTravail::class, "pt");

        $rsm->addFieldResult("pt", "date_debut", "dateDebut");
        $rsm->addFieldResult("pt", "date_fin", "dateFin");
        $rsm->addFieldResult("pt", "remarque", "remarque");
        $rsm->addFieldResult("pt", "id_plage", "idPlage");
        $rsm->addMetaResult("pt", "id_ticket", "idTicket");


        $stmt = $this->getEntityManager()->createNativeQuery($query_sql, $rsm);
        $stmt->setParameter(1, 2);

        $stmt->execute();

        $tickets = $stmt->getResult();

        return $tickets;
    }


}
