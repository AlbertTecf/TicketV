<?php

namespace AppBundle\Form;

use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class TicketType extends AbstractType
{

    private $utilisateurs;

    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $this->utilisateurs = $options["utilisateurs"];

        $builder->add('idProjet', EntityType::class, array(
            'class' => 'AppBundle:Projet',
            'choice_label' => 'libelle',
            'label'=>'Projet : '
        ))

        ->add('idStatut', EntityType::class, array(
              'class' => 'AppBundle:Statut',
              'choice_label' => 'libelle',
              'label'=>'Statut : '
         ))
        ->add('miseAJour', EntityType::class, array(
          'class' => 'AppBundle:MiseAJour',
          'choice_label' => 'version',
          'required' => false,
          'placeholder'   =>'Aucune',
          'empty_data'  => null,
          'label'=>'Mise à jour : '
        ))
        ->add('idDegreImportance', EntityType::class, array(
            'class' => 'AppBundle:DegreImportance',
            'choice_label' => 'libelle',
            'label'=>'Importance : '
        ))
        ->add('libelle',TextType::class,['label'=>'Libellé : '])
        ->add('description',TextareaType::class,['label'=>'Description : '])

        ->add('utilisateurs', EntityType::class, array(
            'class' => 'AppBundle:FosUser',
            'choice_label' => 'username',
            'label'=>'Utilisateurs : ',
            'multiple'=>true
        ))

        ->add('tagsTag', EntityType::class, array(
            'class' => 'AppBundle:Tags',
            'choice_label' => 'libelle',
            'label'=>'Tags : ',
            'multiple'=>true
        ));

    }
    
    /**
     * {@inheritdoc}
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'AppBundle\Entity\Ticket',
            'utilisateurs'=>null
        ));
    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix()
    {
        return 'appbundle_ticket';
    }


}
