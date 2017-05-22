<?php

namespace AppBundle\Repository;

use AppBundle\Entity\CommentaireTicket;
use AppBundle\Entity\FosUser;
use AppBundle\Entity\Ticket;
use Doctrine\ORM\Query\ResultSetMapping;
use Doctrine\ORM\Query\ResultSetMappingBuilder;
/**
 * CommentaireTicketRepository
 *
 * This class was generated by the Doctrine ORM. Add your own custom
 * repository methods below.
 */
class CommentaireTicketRepository extends \Doctrine\ORM\EntityRepository
{

    public function getAllByTicket($id_ticket)
    {

        return $this->createQueryBuilder('c')
                            ->where('c.ticket = :id_ticket')
                            ->orderBy('c.idCommentaireTicket','DESC')
                            ->setParameter('id_ticket', $id_ticket)
                            ->getQuery()->getResult();
    }


    /**
     * Add Commentaire
     *
     * @param \AppBundle\Entity\FosUser $user
     * @param String $remarque
     *
     * @return Ticket
     */
    public function addCommentaire(Ticket $ticket,FosUser $user, $remarque)
    {
        $commentaire = new CommentaireTicket();
        $commentaire->setDate(new \DateTime());
        $commentaire->setUtilisateur($user);
        $commentaire->setTicket($ticket);
        $commentaire->setRemarque($remarque);

        $this->getEntityManager()->persist($commentaire);
        $this->getEntityManager()->flush($commentaire);

        return $this;
    }

}

